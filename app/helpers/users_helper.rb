module UsersHelper
  def create_transaction(parent, child)
    parent.transaction do
      child.transaction do
        parent.save
        child.user_id = parent.id
        child.save!
      end
    end
  end
end
