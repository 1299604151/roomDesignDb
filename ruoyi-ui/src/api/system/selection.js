import request from '@/utils/request'

// 查询选课信息列表
export function listSelection(query) {
  return request({
    url: '/system/selection/list',
    method: 'get',
    params: query
  })
}

// 查询选课信息详细
export function getSelection(id) {
  return request({
    url: '/system/selection/' + id,
    method: 'get'
  })
}

// 新增选课信息
export function addSelection(data) {
  return request({
    url: '/system/selection',
    method: 'post',
    data: data
  })
}

// 修改选课信息
export function updateSelection(data) {
  return request({
    url: '/system/selection',
    method: 'put',
    data: data
  })
}

// 删除选课信息
export function delSelection(id) {
  return request({
    url: '/system/selection/' + id,
    method: 'delete'
  })
}
