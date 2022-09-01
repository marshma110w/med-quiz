ActiveAdmin.register User do
  permit_params :email, :password, :password_confirmation, :name

  index do
    selectable_column
    id_column
    column :email
    column :name
    column :created_at
    column :updated_at
    actions
  end

  filter :name
  filter :email
  filter :created_at

  form do |f|
    f.inputs 'User' do
      f.input :name
      f.input :email
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end
end
