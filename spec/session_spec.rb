RSpec.describe Paladins do

  context '#ping' do
    it 'ping the API' do
      expect(Paladins::Session.ping).not_to be nil
    end
  end

  context '#createsession' do
    it 'create a valid session' do
      expect(Paladins::Session.createsession).not_to be nil
    end
  end

  context '#testsession' do
    it 'test session' do
      session_id = Paladins::Session.createsession.dig('session_id')
      expect(Paladins::Session.testsession(session_id)).not_to be nil
    end
  end

  context '#gethirezserverstatus' do
    it 'test session' do
      session_id = Paladins::Session.createsession.dig('session_id')
      expect(Paladins::Session.gethirezserverstatus(session_id)).not_to be nil
    end
  end

end
