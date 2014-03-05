ENV['DOTFILES_DIR'] = File.join('.', 'spec/fixtures/dotfiles')
ENV['HOME_PATH'] = File.join('.', 'temp/home/username')

describe 'dotphile' do
  describe '-c' do
    before do
      @output = %x{ ./dotphile -c }
      @status = $?
    end

    context 'output' do
      subject { @output.split("\n") }

      it { should include 'dotfiles_dir=./spec/fixtures/dotfiles' }
      it { should include 'home_path=./temp/home/username' }
    end

    context 'status' do
      subject { @status.to_i }

      it { should eq 0 }
    end
  end

  describe '-a' do
    context 'when both arguments are provided' do
      context 'when both arguments are valid' do
        let(:package) { }
        let(:configuration_file_path) { }

        before do
          @output = %x{ ./dotphile -a #{package} #{configuration_file_path} }
          @status = $?
        end

        context 'output' do
          subject { @output }
        end

        context 'status' do
          subject { @status.to_i }

          it { should eq 0 }
        end
      end
    end
  end
end
