require_relative './spec/test_helper'
require_relative './app/app'

describe App do
    before(:each) do
        @incremental = App.new
    end
    it 'should return [1] when input [0]' do
        input = [0]
        expected_output = [1]

        actual_output = @incremental.increment(input)
        expect(actual_output).to eq(expected_output)
    end
    it 'should return [2] when input [1]' do
        input = [1]
        expected_output = [2]

        actual_output = @incremental.increment(input)
        expect(actual_output).to eq(expected_output)
    end
    it 'should return [1, 0] when input [9]' do
        input = [9]
        expected_output = [1, 0]

        actual_output = @incremental.increment(input)
        expect(actual_output).to eq(expected_output)
    end
    it 'should return [2, 0] when input [1, 9]' do
        input = [1, 9]
        expected_output = [2, 0]

        actual_output = @incremental.increment(input)
        expect(actual_output).to eq(expected_output)
    end
end