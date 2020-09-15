[
  (self: super: {
    my.obsidian = (super.callPackage ./obsidian.nix {});
    my.jdk7 = (super.callPackage ./jdk7.nix {});
  })
]
