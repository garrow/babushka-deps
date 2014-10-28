dep 'osx.southpaw_scrolling' do
  requires 'osx.boolean_setting'.with("NSGlobalDomain com.apple.swipescrolldirection", :false)
end

dep 'osx' do
  requires 'osx.boolean_setting'.with('com.apple.dock dashboard-in-overlay', :true),
    'osx.southpaw_scrolling',
    'osx.finder.show_file_extensions',
    'osx.finder.show_posix_path_as_title',
    'osx.dont_save_to_icloud',
    'osx.Allow text selection in Preview'
end

dep 'osx.Allow text selection in Preview' do
  requires 'osx.boolean_setting'.with(
    'com.apple.finder QLEnableTextSelection', :true)
end

dep'osx.finder.show_file_extensions' do
  requires 'osx.boolean_setting'.with(
    'NSGlobalDomain AppleShowAllExtensions', :true)
end

dep 'osx.finder.show_posix_path_as_title' do
  requires 'osx.boolean_setting'.with(
    'com.apple.finder _FXShowPosixPathInTitle', :true)
end

dep 'osx.dont_save_to_icloud' do
  requires 'osx.boolean_setting'.with(
    'NSGlobalDomain NSDocumentSaveNewDocumentsToCloud', :false)
end

dep 'osx.installed_font_file', :source_font_file do

  def font_file_name
    File.basename(source_font_file)
  end

  def installed_font_file
    File.join font_directory, font_file_name
  end

  def font_directory
    '/Library/Fonts/'
  end

  met? { installed_font_file.p.exist? }
  meet {
    log "Installing #{font_file_name} Font"
    shell "cp #{source_font_file} #{installed_font_file}", :spinner => true
  }
end

dep 'osx.boolean_setting', :setting_name, :setting_value do
  setting_value.default(:false)

  def values
    { 'true' => '1', 'false' => '0'}
  end

  def write_value
    setting_value.to_s
  end

  def expected_value
    values[write_value]
  end

  def current_value
    shell("defaults read #{setting_name}").to_s
  end

  met? {
    current_value.include?(expected_value)
  }

  meet {
    log "Writing #{setting_name} to #{write_value}"
    shell("defaults write #{setting_name} -bool #{write_value}", log: true)
  }
end
