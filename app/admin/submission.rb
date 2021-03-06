ActiveAdmin.register Submission do
  belongs_to :challenge, parent_class: Challenge
  navigation_menu :challenge

  filter :participant_id
  filter :name
  filter :media_content_type
  filter :score
  filter :score_secondary
  filter :post_challenge
  filter :grading_status_cd
  filter :grading_message

  index do
    selectable_column
    column :id
    column :participant_id
    column :score
    column :score_secondary
    column :grading_status_cd
    column :grading_message
    column :post_challenge
    column :media_content_type
    column :created_at
    column :updated_at
    actions
  end

  controller do
    def find_resource
      scoped_collection.find(params[:id])
    end
    def permitted_params
      params.permit!
    end
  end

  form do |f|
    f.inputs "Submission" do
      f.input :challenge, :as => :select, :collection => Challenge.all.collect {|challenge| [challenge.challenge, challenge.id] }
      f.input :challenge_round_id
      f.input :score
      f.input :score_secondary
      f.input :description_markdown
      f.input :grading_status_cd
      f.input :grading_message
      f.input :post_challenge
      f.input :media_large
      f.input :media_thumbnail
      f.input :media_content_type
      f.input :vote_count
    end
    f.actions
  end

  csv do
    column :id
    column :participant_id
    column(:participant) { |submission| submission.participant.name }
    column :score
    column :score_secondary
    column :grading_status_cd
    column :grading_message
    column :post_challenge
    column :media_content_type
    column :created_at
    column :updated_at
  end

end
