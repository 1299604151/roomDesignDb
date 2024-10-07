import request from '@/utils/request'

// 查询用户评论列表
export function listDsgnComments(query) {
  return request({
    url: '/dsgn/dsgnComments/list',
    method: 'get',
    params: query
  })
}

// 查询用户评论详细
export function getDsgnComments(id) {
  return request({
    url: '/dsgn/dsgnComments/' + id,
    method: 'get'
  })
}

// 新增用户评论
export function addDsgnComments(data) {
  return request({
    url: '/dsgn/dsgnComments',
    method: 'post',
    data: data
  })
}

// 修改用户评论
export function updateDsgnComments(data) {
  return request({
    url: '/dsgn/dsgnComments',
    method: 'put',
    data: data
  })
}

// 删除用户评论
export function delDsgnComments(id) {
  return request({
    url: '/dsgn/dsgnComments/' + id,
    method: 'delete'
  })
}
