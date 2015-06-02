dep 'flynn', template: 'bin' do
  requires 'virtualbox', 'vagrant'

  provides 'flynn'

  meet {
    system 'L=/usr/local/bin/flynn && curl -sSL -A "`uname -sp`" https://dl.flynn.io/cli | zcat >$L && chmod +x $L'
  }
end

