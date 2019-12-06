ltm rule some_redirect {
    when HTTP_REQUEST {
  if { [HTTP::host] contains "foo-a." } {
         virtual V_Balance_a
  } elseif { [HTTP::host] contains "foo-b." } {
         virtual V_Balance_b
  } elseif { [HTTP::host] contains "foo-c." } {
         virtual V_Balance_c
  }
}
}
