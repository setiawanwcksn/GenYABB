require_relative './wli'

describe WhoLikeIt do
    it "no one likes this" do
        wli = WhoLikeIt.new
        wli.names = []
        likes = wli.likes
        expect(likes).to eq("no one likes this")
    end
    it "Peter likes this" do
        wli = WhoLikeIt.new
        wli.names = ["Peter"]
        likes = wli.likes
        expect(likes).to eq("Peter likes this")
    end
    it "Peter and Jack like this" do
        wli = WhoLikeIt.new
        wli.names = ["Peter", "Jack"]
        likes = wli.likes
        expect(likes).to eq("Peter and Jack like this")
    end
end