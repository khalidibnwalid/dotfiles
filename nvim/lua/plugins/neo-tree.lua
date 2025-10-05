return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-tree/nvim-web-devicons", -- optional, but recommended
    },
    keys = {
        -- Press <Leader>e to toggle the filesystem explorer
        { '<leader>e', ':Neotree toggle<cr>', desc = 'Toggle Neo-tree' },
    
        -- Optional: Open the git status view
        { '<leader>g', ':Neotree source=git_status<cr>', desc = 'Git Status' },
    
        -- Optional: Open the buffers view
        { '<leader>b', ':Neotree source=buffers<cr>', desc = 'Buffers' },
    },
    lazy = false, -- neo-tree will lazily load itself
  }
}
