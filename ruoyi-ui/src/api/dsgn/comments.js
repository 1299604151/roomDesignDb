import request from '@/utils/request'

// 查询用户评论列表
export function listComments(query) {
  return request({
    url: '/system/comments/list',
    method: 'get',
    params: query
  })
}

// 查询用户评论详细
export function getComments(id) {
  return request({
    url: '/system/comments/' + id,
    method: 'get'
  })
}

// 新增用户评论
export function addComments(data) {
  return request({
    url: '/system/comments',
    method: 'post',
    data: data
  })
}

// 修改用户评论
export function updateComments(data) {
  return request({
    url: '/system/comments',
    method: 'put',
    data: data
  })
}

// 删除用户评论
export function delComments(id) {
  return request({
    url: '/system/comments/' + id,
    method: 'delete'
  })
}
