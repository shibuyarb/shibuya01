REPOSITORY        = "shibuyarb/shibuya01"
SOURCE_REPOSITORY = if ENV['GH_TOKEN']
                      "https://$GH_TOKEN@github.com/#{REPOSITORY}"
                    else
                      "git@github.com:#{REPOSITORY}.git"
                    end

PUBLISH_BRANCH    = 'gh-pages'
SOURCE_BRANCH     = 'master'
BUILD_DIR         = 'build'

require 'fileutils'
def initialize_repository
  if Dir["#{BUILD_DIR}/.git"].empty?
    FileUtils.rm_rf BUILD_DIR
    sh "git clone --quiet -b #{SOURCE_BRANCH} #{SOURCE_REPOSITORY} #{BUILD_DIR} 2> /dev/null"
  end
  Dir.chdir BUILD_DIR do
    sh "git checkout --orphan #{PUBLISH_BRANCH}"
  end
end

def update_repository
  Dir.chdir BUILD_DIR do
    sh "git fetch origin #{SOURCE_BRANCH}"
    sh "git reset --hard origin/#{PUBLISH_BRANCH}"
    sh "git clean -fd"
  end
end

def build
  sh 'bundle exec middleman build'
end

def deploy
  sha1, _ = `git log -n 1 --oneline`.strip.split(' ')
  Dir.chdir BUILD_DIR do
    sh 'git add -A'
    sh "git commit -m 'Update with #{sha1}'"
    sh "git push --quiet #{SOURCE_REPOSITORY} #{PUBLISH_BRANCH} 2> /dev/null"
  end
end

desc 'Setup origin repository for GitHub pages'
task :setup do
  initialize_repository
  update_repository
end
desc 'Clean built files'
task :clean do
  update_repository
end
desc 'Builds the static site'
task :build => ['clean'] do
  build
end
desc 'Deploy a middleman built site'
task :deploy do
  deploy
end
