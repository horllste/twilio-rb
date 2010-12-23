module Twilio
  class Participant
    include Twilio::Resource
    include Twilio::Deletable

    alias kick! destroy

    def mute!
      state_guard do
        update_attributes muted? ? { :muted => false } : { :muted => true }
      end
    end

    def muted?
      muted
    end

    private

    def path
      "/Accounts/#{Twilio::ACCOUNT_SID}/Conferences/#{conference_sid}/Participants/#{call_sid}.json"
    end
  end
end