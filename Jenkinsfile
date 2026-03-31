@Library(value='ibp-libraries', changelog=false) _

def config = [:]

node {
  checkout scm
  config = readYaml file: "library-config.yaml"
  config["pod_label"] = jobPodLabel()
}

pipeline {
  agent {
    kubernetes {
      label "${config.pod_label}"
      defaultContainer "ruby"
      yaml """
        apiVersion: v1
        kind: Pod
        spec:
            containers:
            - name: ruby
              image: 'docker.intuit.com/${config.rubyImage}'
              command:
              - cat
              tty: true
      """
    }
  }

  post {
    always {
      node('') {
        checkout scm
        customReleaseMetrics(config)
      }
    }
  }

  environment {
    MAVEN_ARTIFACTORY_CREDENTIALS = credentials("${config.artifactoryCredentialsId}")
    RUBY_ARTIFACTORY_USERID = "${env.MAVEN_ARTIFACTORY_CREDENTIALS_USR}"
    RUBY_ARTIFACTORY_TOKEN = "${env.MAVEN_ARTIFACTORY_CREDENTIALS_PSW}"
    RUBYGEMS_HOST = "https://artifact.intuit.com/artifactory/api/gems/rubygems-intuit"
    GIT_BRANCH = "${env.BRANCH_NAME}"
  }

  stages {
    stage('Build Gem') {
      steps {
        wrap([$class: 'AnsiColorBuildWrapper', 'colorMapName': 'xterm']) {
          container('ruby') {
            sh """
              gem install bundler -v 2.5.3
              bundle _2.5.3_ install
              gem build cybersource_rest_client.gemspec
            """
          }
        }
      }
    }

    stage('Run Tests') {
      steps {
        wrap([$class: 'AnsiColorBuildWrapper', 'colorMapName': 'xterm']) {
          container('ruby') {
            sh """
              bundle config set force_ruby_platform true
              bundle install
              bundle exec rake
            """
          }
        }
      }
    }

    stage('Run Lint') {
      steps {
        wrap([$class: 'AnsiColorBuildWrapper', 'colorMapName': 'xterm']) {
          container('ruby') {
            sh """
              bundle exec rubocop
            """
          }
        }
      }
    }

    stage('Publish Gem') {
      when {
        allOf {
          not { changeRequest() }
        }
      }
      steps {
        wrap([$class: 'AnsiColorBuildWrapper', 'colorMapName': 'xterm']) {
          container('ruby') {
            sh """
              export GEM_HOST_API_KEY="Basic \$(echo -n "${env.RUBY_ARTIFACTORY_USERID}:${env.RUBY_ARTIFACTORY_TOKEN}" | base64 -w 0)"
              export VERSION=\$(ruby -r "./lib/cybersource_rest_client/version.rb" -e "puts CyberSource::VERSION")
              gem push --verbose "cybersource_rest_client-\${VERSION}.gem" --host ${env.RUBYGEMS_HOST}
            """
          }
        }
      }
    }
  }
}
