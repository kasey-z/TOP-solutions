require "spec_helper"
require "tic_tac_toe.rb"
require "stringio"

describe TicTacToe do
  let(:input1){double('input1')}
  let(:input2){double('input2')}
  let(:first_player) {Players.new(input1)}
  let(:second_player){Players.new(input2)}
  let(:game)         {TicTacToe.new(first_player, second_player)}

  describe "#win?" do
    context "when 1,2,3 is crossed by the same player" do
      it "return the player" do
        first_player.grids = %w{1 2 3}
        expect(game.send(:win?,first_player)).to eql(first_player)
      end
    end

    context "when 1,2,3 is crossed by different player" do
      it "return false" do
        first_player.grids = %W{1 2}
        second_player.grids = ["3"]
        expect(game.send(:win?,first_player)).to eql(false)
        expect(game.send(:win?,second_player)).to eql(false)
      end
    end
  end

  describe "#take_number" do
    context "when player's input is a number 1-9 " do
      it "returns the number" do
        allow(game).to receive(:gets).and_return("5")
        expect(game.send(:take_number,"someone")).to eql("5")
      end
    end

    context "when player's input is not 1-9" do
      it "ask for input again until input a number 1-9 " do
        allow(game).to receive(:gets) do
          @i ||= 0
          input = @i > 2 ? '5' : "something"
          @i += 1
          input
        end
        expect(game.send(:take_number,"someone")).to eql('5')
        expect(@i).to be > 2
      end
    end

    context "when the input number is taken" do
      it "ask for a valid input until input a valid and not repeated number 1-9" do
        game.send(:number_to_name,'5','name')
        allow(game).to receive(:gets) do
          @i ||= 0
          input = @i > 2 ? rand(1..9).to_s : "5"
          @i += 1
          input
        end
        expect(game.send(:take_number,"someone")).not_to eql('5')
        expect(@i).to be > 2
      end
    end
  end

  describe "#number_to_name" do
    it "replace the number on the board with a string" do
    expect(game.send(:number_to_name,'5','name')).to eql([["1","2","3"],["4","name","6"],["7","8","9"]])
    end
  end

  describe "#shift_player" do
    context "when the current is first_player" do
      it "changes the current to second_player" do
        expect {
          game.send(:shift_player)
        }.to change{game.instance_variable_get(:@current)}.from(first_player).to(second_player)
      end
    end
    context "when the current is second_player" do
      it "change the current to first_player" do
        game.instance_variable_set(:@current, second_player)
        expect {
          game.send(:shift_player)
        }.to change{game.instance_variable_get(:@current)}.from(second_player).to(first_player)
      end
    end
  end

  describe "#playing" do
    context "when someone wins before the game end" do
      it "return a string including (player's name)'s player, you win! Congratulations!" do
        allow(game).to receive(:gets) do
          @i ||= 1
          input = case @i
          when 1 then "1" #x
          when 2 then "4" #o
          when 3 then "2" #x
          when 4 then "5" #o
          when 5 then "3" #x
          end
          @i += 1
          input
        end
        expect(game.playing).to include("#{first_player.name}'s player, you win! Congratulations!")
      end
    end

    context "when someone wins after the game end" do
      it "return a string including (player's name)'s player, you win! Congratulations!" do
        allow(game).to receive(:gets) do
          @i ||= 1
          input = case @i
          when 1 then "2" #x
          when 2 then "1" #o
          when 3 then "4" #x
          when 4 then "6" #o
          when 5 then "3" #x
          when 6 then "7" #0
          when 7 then "8" #x
          when 8 then "9" #o
          when 9 then "5" #x
          end
          @i += 1
          input
        end
        expect(game.playing).to include("#{first_player.name}'s player, you win! Congratulations!")
      end
    end

    context "when no one wins after the game end"  do
      it "return a string including You are tie!" do
        allow(game).to receive(:gets) do
          @i ||= 1
          input = case @i
          when 1 then "5" #x
          when 2 then "3" #o
          when 3 then "8" #x
          when 4 then "2" #o
          when 5 then "1" #x
          when 6 then "9" #0
          when 7 then "6" #x
          when 8 then "4" #o
          when 9 then "7" #x
          end
          @i += 1
          input
        end
        expect(game.playing).to include("You are tie!")
      end
    end
  end
end
