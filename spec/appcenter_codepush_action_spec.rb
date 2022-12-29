describe Fastlane::Actions::AppcenterCodepushAction do
  describe '#run' do
    it 'prints a message' do
      expect(Fastlane::UI).to receive(:message).with("The appcenter_codepush plugin is working!")

      Fastlane::Actions::AppcenterCodepushAction.run(nil)
    end
  end
end
