return {
  'nvim-telescope/telescope-fzf-native.nvim',
  dependencies = {
    {
      "junegunn/fzf",
      build = ":call fzf#install()",
    },
  },
  build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release'
}
