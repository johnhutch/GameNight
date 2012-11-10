FactoryGirl.define do
  factory :role do
    factory :nobody_role do
      name 'nobody'
    end

    factory :commenter_role do
      name 'commenter'
    end

    factory :friend_role do
      name 'friend'
    end

    factory :author_role do 
      name 'author'
    end

    factory :uploader_role do
      name 'uploader'
    end

    factory :admin_role do
     name 'admin' 
    end
  end

  sequence(:gamename) { |n| "Board Game #{n}"}
  sequence(:nightname) { |n| "Game Night #{n}"}

  factory :night do
    name { generate(:nightname) }
  end

  factory :game do
    name { generate(:gamename) }
  end

  sequence(:name) { |n| "Joe User #{n}"}
  sequence(:email) { |n| "johnhutch+user#{n}@gmail.com"}

  factory :user do
    name { generate(:name) }
    email
    password 'secret'
    
    factory :admin, :class => User do
      name { generate(:name) }
      email
      after(:create) { |user| user.roles << FactoryGirl.create(:admin_role) }
    end
    
    factory :author , :class => User do
      name { generate(:name) }
      email
      after(:create) { |user|
        user.roles << FactoryGirl.create(:nobody_role)
        user.roles << FactoryGirl.create(:commenter_role)
        user.roles << FactoryGirl.create(:friend_role)
        user.roles << FactoryGirl.create(:author_role)
        user.roles << FactoryGirl.create(:uploader_role)
      }
    end

    factory :uploader, :class => User do
      name { generate(:name) }
      email
      after(:create) { |user|
        user.roles << FactoryGirl.create(:nobody_role)
        user.roles << FactoryGirl.create(:commenter_role)
        user.roles << FactoryGirl.create(:friend_role)
        user.roles << FactoryGirl.create(:author_role)
        user.roles << FactoryGirl.create(:uploader_role)
      }
    end

    factory :commenter, :class => User do
      name { generate(:name) }
      email
      after(:create) { |user|
        user.roles << FactoryGirl.create(:nobody_role)
        user.roles << FactoryGirl.create(:commenter_role)
      }
    end

    factory :friend, :class => User do
      name { generate(:name) }
      email
      after(:create) { |user|
        user.roles << FactoryGirl.create(:nobody_role)
        user.roles << FactoryGirl.create(:commenter_role)
        user.roles << FactoryGirl.create(:friend_role)
        user.roles << FactoryGirl.create(:author_role)
        user.roles << FactoryGirl.create(:uploader_role)
      }
    end

    factory :author_commenter, :class => User do
      name { generate(:name) }
      email
      after(:create) { |user| 
        user.roles << FactoryGirl.create(:nobody_role)
        user.roles << FactoryGirl.create(:commenter_role)
        user.roles << FactoryGirl.create(:friend_role)
        user.roles << FactoryGirl.create(:author_role)
        user.roles << FactoryGirl.create(:uploader_role)
      }
    end

    factory :gamer, :class => User do
      name { generate(:name) }
      email
      after(:create) { |user|
        user.roles << FactoryGirl.create(:nobody_role)
        user.roles << FactoryGirl.create(:commenter_role)
        user.roles << FactoryGirl.create(:friend_role)
        user.roles << FactoryGirl.create(:author_role)
        user.roles << FactoryGirl.create(:uploader_role)
        user.games << FactoryGirl.create(:game)
        user.games << FactoryGirl.create(:game)
        user.games << FactoryGirl.create(:game)
     }
    end
  end
  
  sequence(:title) { |n| "Post Title #{n}"}
  sequence(:body) { |n| "The inner post body #{n}"}

  factory :post do
    title
    body
  end

  factory :comment do
    body
  end
 
  sequence(:caption) { |n| "This is the photo caption #{n}"}
 
  factory :photo do
    title
    caption
    image { Rack::Test::UploadedFile.new("#{Rails.root}/spec/samples/hutchhead.png", 'image/png', true) }
    
    #broken lazy fixture as of paperclip ver. 3.0.1 -- try again after an update
    #image { paperclip_fixture("photo", "spec/samples/hutchhead.png", "image/png") }
  end
  factory :photo2 do
    title
    caption
    image { Rack::Test::UploadedFile.new("#{Rails.root}/spec/samples/mark.png", 'image/png', true) }
  end

end
