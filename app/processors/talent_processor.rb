class TalentProcessor < JSONAPI::Processor
  def remove_resource
    ActiveRecord::Base.transaction do
      courses = Course.where(author_id: params[:resource_id])
      if courses.any?
        new_author_id = context[:params].require(:new_author_id)
        courses.in_batches.each do |relation|
          relation.update_all(author_id: new_author_id)
        end
      end

      super
    end
  end
end