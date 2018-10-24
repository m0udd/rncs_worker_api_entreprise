require 'rails_helper'

describe TribunalCommerce::DailyUpdate::Operation::Import do
  subject { described_class.call }

  # spec/fixtures/tc/flux/2018/04/
  # ├── 09
  # │   ├── 0110
  # │   ├── 1237
  # │   └── 9402
  # ├── 10
  # ├── 11
  # ├── 12
  # ├── 13
  # ├── 14
  # └── 18
  context 'when Task::NextQueuedUpdate returns a daily update to import' do
    let(:fetched_update) { subject[:daily_update] }
    before do
      create(:daily_update_with_completed_units, year: '2018', month: '04', day: '08', proceeded: true)
      create(:daily_update_tribunal_commerce, year: '2018', month: '04', day: '09', proceeded: false, files_path: Rails.root.join('spec/fixtures/tc/flux/2018/04/09'))
      create(:daily_update_tribunal_commerce, year: '2018', month: '04', day: '10', proceeded: false)
      create(:daily_update_tribunal_commerce, year: '2018', month: '04', day: '11', proceeded: false)
    end

    describe 'the retrieved daily update for import' do
      # TODO this spec should be removed when mock/stub/double for operations are setup
      # indeed the spec is already tested in the nested operation specs
      it 'is the right one' do
        # According to fixtures data, next queued update to import should be 2018-04-09
        expect(fetched_update.date).to eq(Date.new(2018, 4, 9))
      end

      it 'sets the daily update \'s proceeded attribute to true' do
        expect(fetched_update).to be_proceeded
      end

      it 'is now in "PENDING" status' do
        expect(fetched_update.status).to eq('PENDING')
      end
    end

    context 'when Task::FetchUnits is success' do
      it { is_expected.to be_success }

      # More detailed tests on created daily update units inside Task::FetchUnits
      it 'creates the daily update units found' do
        expect { subject }.to change(DailyUpdateUnit, :count).by(3)
      end

      it 'creates a job for each unit to import' do
        units_id = fetched_update.daily_update_units.pluck(:id)
        units_id.each do |id|
          expect(ImportTcDailyUpdateUnitJob)
            .to have_been_enqueued.with(id).on_queue('tc_daily_update')
        end
      end
    end

    context 'when Task::FetchUnits fails' do
      it 'fails'
      it 'logs the returned error'
    end
  end

  context 'when Task::NextQueuedUpdate fails' do
    it 'fails'
    it 'logs the returned error'
  end
end