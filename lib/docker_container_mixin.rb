module DockerContainerMixin
  def binds
    json['HostConfig']['Binds']
  end

  def port_bindings
    json['HostConfig']['PortBindings'].try(:map) { |key, value| [key.to_i, value.first['HostPort'].to_i] }.to_h
  end
end
