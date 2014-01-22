class Post < ActiveRecord::Base

 validates_presence_of :title, :body
 after_save :deliver_post


 private

 def deliver_post
   PostMailer.post.deliver
 end

end
