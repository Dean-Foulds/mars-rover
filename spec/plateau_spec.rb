describe 'Plateau' do
    let(:plateau) { Plateau.new '55' }

    describe "properties" do
    it "should be new plateau size equal to 5 x 5" do
        expect(plateau).to be_an_instance_of(Plateau)
    end
  end    
end
