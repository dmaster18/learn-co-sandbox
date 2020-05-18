class CreateTweets < ActiveRecord::Migration
  def change

    create_table :tweets
      t.string :content



    end


  end




end
