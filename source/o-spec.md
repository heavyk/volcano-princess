# O
### get
value = o!

### set
old_value = o new_value

### transform forward
oo = O o, ((ov) -> new_oo_value)

### transform forward/back
oo = O o, ((ov) -> new_oo_value), ((oo_v) -> new_o_value)

### transform forward (many O)
oo = O o1, o2, o3, ((ov1, ov2, ov3) -> new_oo_value)

### transform forward/back (many O)
oo = O o1, o2, o3, ((ov1, ov2, ov3) -> new_oo_value), ((oov) !-> ...)
// bak_fn should be called next tick, so can set o1, o2, o3

## actions

### when value
o value, -> do_something
o.when value, -> do_something

```
Background = O BLACK

Background BLACK, ->
    # do something (in this case, immediately cause the value is already BLACK)
```

### split and transform forward
o1, o2, o3 = o.split ((vl,v2,v3) -> vl + v2 + v3), ((vl,v2,v3) -> vl + v2 - v3), ((vl,v2,v3) -> vl - v2 - v3)

### join and transform forward/back
o = o1.join o2,o3,o4, ((v1,v2,v3) -> v1 + v2 + v3), (() -> v1 + v2 + v3)
