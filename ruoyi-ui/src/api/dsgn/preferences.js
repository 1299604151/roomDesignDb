import request from '@/utils/request'

// 查询用户偏好列表
export function listPreferences(query) {
  return request({
    url: '/system/preferences/list',
    method: 'get',
    params: query
  })
}

// 查询用户偏好详细
export function getPreferences(id) {
  return request({
    url: '/system/preferences/' + id,
    method: 'get'
  })
}

// 新增用户偏好
export function addPreferences(data) {
  return request({
    url: '/system/preferences',
    method: 'post',
    data: data
  })
}

// 修改用户偏好
export function updatePreferences(data) {
  return request({
    url: '/system/preferences',
    method: 'put',
    data: data
  })
}

// 删除用户偏好
export function delPreferences(id) {
  return request({
    url: '/system/preferences/' + id,
    method: 'delete'
  })
}
