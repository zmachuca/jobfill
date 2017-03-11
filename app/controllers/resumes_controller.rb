class ResumesController < ApplicationController

	def new
    @resume = Resume.new
    @post = Post.find(params[:post_id])
  end

	def create
    @resume = current_user.resumes.build(resume_params)
    if @resume.save
      redirect_to @resume, notice: 'Resume was successfully created'
    else
      render :new
    end
  end

  private

  def resume_params
      params.require(:resume).permit(:document)
    end

end