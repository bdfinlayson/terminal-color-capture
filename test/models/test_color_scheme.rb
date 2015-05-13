require_relative '../helper'

describe ColorScheme do
    describe "#all" do
        describe "if there are no color schemes in the databse" do
            it "should return an empty array" do
                assert_equal [],ColorScheme.all
            end
        end
        describe "if there are color schemes in the database" do
            before do
                ColorScheme.create('test','blue','none','red','11:00-23:00','true')
                ColorScheme.create('test2','black','none','blue','10:00-11:00','false')
                ColorScheme.create('test3','green','none','blue','9:00-10:00','true')
            end
            it "should return an array" do
                assert_equal Array,ColorScheme.all.class
            end
            it "should return the color schemes in database order" do
                expected = ['test','test2','test3']
                actual = ColorScheme.all.map{|color_scheme| color_scheme.name}
                assert_equal expected,actual
            end
        end
    end

    describe "#count" do
        describe "if there are no color schemes in the databse" do
            it "should return 0" do
                assert_equal 0,ColorScheme.count
            end
        end
        describe "if there are color schemes in the database" do
            before do
                ColorScheme.create('test','blue','none','red','11:00-23:00','true')
                ColorScheme.create('test2','black','none','blue','10:00-11:00','false')
                ColorScheme.create('test3','green','none','blue','9:00-10:00','true')
            end
            it "should return the correct count" do
                assert_equal 3,ColorScheme.count
            end
        end
    end
end