
require 'spec_helper'

describe 'motd::register' do

  opts = {
    'Debian' => {
    :arch      => 'amd64',
    },
    'Redhat' => {
      :arch      => 'x86_64',
    },
    'CentOS' => {
      :arch      => 'x86_64',
    }
  } 
	
  opts.keys.each do |os|
    describe "Running on #{os}" do
      let(:facts) { {
        :operatingsystem => os,
        :architecture    => opts[os][:arch],
        :concat_basedir  => '/var/lib/puppet/concat',
      } }
      
      let(:title)  { 'Test' } 
      let(:name)   { :title } 
    
      it { should include_class('motd::params') }

      context 'No content specified fallback to title' do
        let(:params) { { 
        :content => ''
        } }
        it {
          should contain_concat__fragment("motd::fragment::#{title}").with( {
            :target  => '/etc/motd',
            :content => "	- #{title}\n"
            } ) 
        }
      end
    
      context 'Content specified' do
        let(:params) { { 
          :content => 'Some content'
        } }
        it {
          should contain_concat__fragment("motd::fragment::#{title}").with( {
            :target  => '/etc/motd',
            :content => "	- #{params[:content]}\n"
            } ) 
        }
      end

    end

  end

end
