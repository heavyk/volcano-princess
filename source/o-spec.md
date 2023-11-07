Background = O BLACK

Background BLACK, ->
    # do something

# transform forward
oo = O o, ((ov) -> new_oo_value)

# transform forward/back
oo = O o, ((ov) -> new_oo_value), ((oo_v) -> new_o_value)

# transform forward (many O)
oo = O o1, o2, o3, ((ov1, ov2, ov3) -> new_oo_value)

# transform forward/back (many O)
oo = O o1, o2, o3, ((ov1, ov2, ov3) -> new_oo_value), ((oov) !-> ...)
// bak_fn should be called next tick, so can set o1, o2, o3

# when value
o value, -> do_something