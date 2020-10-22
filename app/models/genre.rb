class Genre < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '新書' },
    { id: 3, name: '文庫' },
    { id: 4, name: '単行本' },
    { id: 5, name: 'その他' }
  ]
end
