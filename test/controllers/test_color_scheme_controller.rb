require_relative '../helper'

describe ColorSchemeController do
    describe "#index" do
        describe "if there are no color schemes in the databse" do
            it "should return an empty database message" do
                assert_equal "No color schemes found. Add a color scheme.\n",
                ColorSchemeController.index
            end
        end
        describe "if there are color schemes in the database" do
            before do
                ColorScheme.create('test','blue','none','red','11:00-23:00','true')
                ColorScheme.create('test2','black','none','blue','10:00-11:00','false')
                ColorScheme.create('test3','green','none','blue','9:00-10:00','true')
            end
            it "should return the color schemes in database order, list format" do
                expected = "1. test\n2. test2\n3. test3\n"
                actual = ColorSchemeController.index
                assert_equal expected,actual
            end
        end
    end

    # describe "#table" do
    #     describe "if there are no color schemes in the databse" do
    #         it "should return an empty database message" do
    #             assert_equal "No color schemes found. Add a color scheme.\n",
    #             ColorSchemeController.index
    #         end
    #     end
    #     describe "if there are color schemes in the database" do
    #         before do
    #             ColorScheme.create('test','blue','none','red','11:00-23:00','true')
    #             ColorScheme.create('test2','black','none','blue','10:00-11:00','false')
    #             ColorScheme.create('test3','green','none','blue','9:00-10:00','true')
    #         end
    #         it "should return the color schemes in database order, table format" do
    #             expected = ""
    #             expected << ""
    #             actual = ColorSchemeController.index
    #             assert_equal expected,actual
    #         end
    #     end
    # end
end