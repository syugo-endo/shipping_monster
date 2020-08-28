class Satisfaction < ActiveHash::Base
  self.data = [
   { id: 1, name: '--' },
   { id: 2, name: '大変満足!!' },
   { id: 3, name: '満足!' },
   { id: 4, name: '普通' },
   { id: 5, name: '改善が必要' },
   { id: 6, name: '利用しない' }
  ]
end