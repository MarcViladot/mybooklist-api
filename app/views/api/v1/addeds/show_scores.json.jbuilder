json.scores 1.upto(10) do |i|
	score_x = @addeds.where("score = ?", i)
	json.members score_x.count()
	json.percentage score_x.count/@addeds.count.to_f * 100 unless score_x.blank?
end



