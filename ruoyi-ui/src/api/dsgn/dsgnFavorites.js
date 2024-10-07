import request from '@/utils/request'

// 查询用户收藏列表
export function listDsgnFavorites(query) {
  return request({
    url: '/dsgn/dsgnFavorites/list',
    method: 'get',
    params: query
  })
}

// 查询用户收藏详细
export function getDsgnFavorites(id) {
  return request({
    url: '/dsgn/dsgnFavorites/' + id,
    method: 'get'
  })
}

// 新增用户收藏
export function addDsgnFavorites(data) {
  return request({
    url: '/dsgn/dsgnFavorites',
    method: 'post',
    data: data
  })
}

// 修改用户收藏
export function updateDsgnFavorites(data) {
  return request({
    url: '/dsgn/dsgnFavorites',
    method: 'put',
    data: data
  })
}

// 删除用户收藏
export function delDsgnFavorites(id) {
  return request({
    url: '/dsgn/dsgnFavorites/' + id,
    method: 'delete'
  })
}
