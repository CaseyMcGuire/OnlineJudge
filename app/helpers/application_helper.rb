module ApplicationHelper

  #returns true if a javascript exists for the given controller.
  #source: http://stackoverflow.com/questions/12828767/in-rails-how-to-check-if-javascript-file-exists-before-using-javascript-include
  def javascript_exists?(script)
    script = "#{Rails.root}/app/assets/javascripts/#{script}.js"
    extensions = %w(.coffee .erb .coffee.erb) + [""]
    extensions.inject(false) do |truth, extension|
      truth || File.exists?("#{script}#{extension}")
    end
  end

  def admin?
    current_user != nil && current_user.admin
  end

  def test_exists?(problem_id, language_id)
    Test.exists?(:problem_id => problem_id, :language_id => language_id)
  end

  def result_exists?(problem_id)
    Result.exists?(:problem_id => problem_id)
  end


end
