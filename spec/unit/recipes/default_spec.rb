#
# Cookbook:: node
# Spec:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.

require 'spec_helper'

describe 'node::default' do
  context 'When all attributes are default, on Ubuntu 16.04' do
    let(:chef_run) do
      # for a complete list of available platforms and versions see:
      # https://github.com/customink/fauxhai/blob/master/PLATFORMS.md
      runner = ChefSpec::SoloRunner.new(platform: 'ubuntu', version: '16.04')
      runner.converge(described_recipe)
    end

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end

    it 'Should install nginx' do
      expect(chef_run).to install_package('nginx')
    end

    it 'Should install nodejs from a recipe' do
      expect(chef_run).to include_recipe('nodejs')
    end

    it 'Should install pm2 via npm' do
      expect(chef_run).to install_nodejs_npm('pm2')
    end
  end
end
