This is an experimental version of Reflectivity with:
- support for object-specific metalinks
- an api to install links on class and objects
- new kind of metalinks: PermaLinks, that automatically reinstall themselves on specific nodes (inspired from https://github.com/peteruhnak/metalinks-toolkit)

# Installation (Pharo 7)
You should load everything. The current repository is synchronized with Pharo-7.0+alpha.build.394.sha.18b211231051b770bcc3b36bfdee1a8faa0332c3 (32 Bit).

```Smalltalk
Metacello new
  baseline: 'ReflectivityDev';
  repository: 'github://StevenCostiou/Reflectivity-dev/repository';
  load.
```

# Reflectivity-dev
Work in progress documentation here: https://github.com/SquareBracketAssociates/Booklet-Reflectivity

