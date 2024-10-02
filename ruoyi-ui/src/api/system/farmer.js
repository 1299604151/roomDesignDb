import request from '@/utils/request'

// 查询农民信息列表
export function listFarmer(query) {
  return request({
    url: '/system/farmer/list',
    method: 'get',
    params: query
  })
}

// 查询农民信息详细
export function getFarmer(id) {
  return request({
    url: '/system/farmer/' + id,
    method: 'get'
  })
}

// 新增农民信息
export function addFarmer(data) {
  return request({
    url: '/system/farmer',
    method: 'post',
    data: data
  })
}
// 注册农户
export function registerFarmer(data) {
  return request({
    url: '/system/farmer/register',
    method: 'post',
    data: data
  })
}

// 修改农民信息
export function updateFarmer(data) {
  return request({
    url: '/system/farmer',
    method: 'put',
    data: data
  })
}

// 删除农民信息
export function delFarmer(id) {
  return request({
    url: '/system/farmer/' + id,
    method: 'delete'
  })
}
