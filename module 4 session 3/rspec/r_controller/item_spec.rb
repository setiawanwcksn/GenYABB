require_relative '../spec/test_helper'
require_relative '../../app/controllers/c_item'
require_relative '../../app/db/mysql_connector'
require_relative '../../app/models/m_item'



describe CItem do
    
    describe '#list_all_items' do
        before (:each) do
            client = create_db_client        
        end
        context 'when initialized with valid input' do
            it 'should show all items from database' do
                controllers = CItem.new
                # actual_view = controllers.list_all_items

                item = MItem.get_all_items
                expected_output = ERB.new(File.read("./views/index.erb")).result(binding)
                expect(expected_output).to eq(actual_view)
            end
        end
    end

end