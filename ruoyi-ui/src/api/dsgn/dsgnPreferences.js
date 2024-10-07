import request from '@/utils/request'

// 查询用户偏好列表
export function listDsgnPreferences(query) {
  return request({
    url: '/dsgn/dsgnPreferences/list',
    method: 'get',
    params: query
  })
}

// 查询用户偏好详细
export function getDsgnPreferences(id) {
  return request({
    url: '/dsgn/dsgnPreferences/' + id,
    method: 'get'
  })
}

// 新增用户偏好
export function addDsgnPreferences(data) {
  return request({
    url: '/dsgn/dsgnPreferences',
    method: 'post',
    data: data
  })
}

// 修改用户偏好
export function updateDsgnPreferences(data) {
  return request({
    url: '/dsgn/dsgnPreferences',
    method: 'put',
    data: data
  })
}

// 删除用户偏好
export function delDsgnPreferences(id) {
  return request({
    url: '/dsgn/dsgnPreferences/' + id,
    method: 'delete'
  })
}
