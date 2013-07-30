dep 'osx.GateKeeperDisabled' do
  met? {
    # TODO - Find a nicer way to do this, when online.
    shell("spctl --status |grep -c 'disabled'").to_s == "1"
  }
  meet {
    system "spctl --master-disable"
  }
end

dep 'osx.AccesibilityAPIEnabled' do
  met? {
   "/private/var/db/.AccessibilityAPIEnabled".p.exists?
  }
  meet {
    shell %q{osascript -e 'tell application "System Events" to set UI elements enabled to true'}
  }
end

dep 'osx.SharedMemoryIncreased' do
  met? {
    "/etc/sysctl.conf".p.grep("kern.sysv.shmmax=1610612736") and "/etc/sysctl.conf".p.grep("kern.sysv.shmall=393216")
  }
  meet { 
    sudo 'echo "kern.sysv.shmmax=1610612736\nkern.sysv.shmall=393216\n" >> /etc/sysctl.conf'
  }
end
