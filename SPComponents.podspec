
Pod::Spec.new do |spec|

  spec.name              = "SPComponents"
  spec.version           = "0.0.1"
  spec.summary           = "SPComponents is a small library of components that are usefull in everyday development."
  spec.description       = "SPComponents is a small library of components that are usefull in everyday development. UIView+Anchors, CheckInternetConnect etc."
  spec.homepage          = "https://github.com/r3dm4n/SPComponents"
  spec.license           = "MIT"

  spec.author            = "Alexandru Corut"
  spec.social_media_url  = "https://twitter.com/AlexandruCorut"
  spec.platform          = :ios, "11.0"

  spec.source            = { :git => "https://github.com/r3dm4n/SPComponents.git", :tag => "#{spec.version}" }
  spec.source_files      = "SPComponents"

end
