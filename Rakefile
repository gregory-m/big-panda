require "bundler/gem_tasks"

require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new('spec')

task default: 'spec'


module Bundler
  class GemHelper
    protected
    def tag_version
      sh "git tag -s -a -m \"Version #{version}\" #{version_tag}"
      Bundler.ui.confirm "Tagged #{version_tag}"
      yield if block_given?
    rescue
      Bundler.ui.error "Untagged #{version_tag} due to error"
      sh_with_code "git tag -d #{version_tag}"
      raise
    end
  end
end
