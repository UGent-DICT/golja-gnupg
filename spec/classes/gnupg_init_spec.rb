require 'spec_helper'

describe 'gnupg', type: :class do
  ['RedHat', 'Debian', 'Linux', 'Suse'].each do |system|
    if system == 'Linux'
      let(:facts) { { osfamily: 'Linux', operatingsystem: 'Amazon' } }
    else
      let(:facts) { { osfamily: system } }
    end

    it { is_expected.to contain_class('gnupg::install') }

    describe "gnupg on system #{system}" do
      context 'when enabled' do
        let(:params) do
          {
            package_ensure: 'present',
            package_name: 'gnupg',
          }
        end

        it {
          is_expected.to contain_package('gnupg').with('ensure' => 'present')
        }
      end

      context 'when disabled' do
        let(:params) do
          {
            package_ensure: 'absent',
            package_name: 'gnupg',
          }
        end

        it {
          is_expected.to contain_package('gnupg').with('ensure' => 'absent')
        }
      end
    end
  end
end
