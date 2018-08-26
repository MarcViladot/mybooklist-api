added_status = ["Reading", "Completed", "On-hold", "Dropped", "Plan to Read"]

	added_status.each do |status|
		json.set! status do 
			json.entries @addeds.where("status = ?", status).count
			json.percentage @addeds.where("status = ?", status).count/@addeds.count.to_f * 100
		end
	end
json.mean_score @addeds.average(:score).to_f
json.total_entries @addeds.count.to_i

pages = @addeds.sum(:progress)
json.total_pages pages
json.days pages*2/60/24.to_f