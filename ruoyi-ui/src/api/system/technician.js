import request from '@/utils/request'

// 查询技术员信息列表
export function listTechnician(query) {
  return request({
    url: '/system/technician/list',
    method: 'get',
    params: query
  })
}

// 查询技术员信息列表所有
export function listTechnicianAll(query) {
  return request({
    url: '/system/technician/all',
    method: 'get'
  })
}

// 查询技术员信息详细
export function getTechnician(id) {
  return request({
    url: '/system/technician/' + id,
    method: 'get'
  })
}

// 注册技术员
export function registerTechnician(data) {
  return request({
    url: '/system/technician/register',
    method: 'post',
    data: data
  })
}
// 新增技术员信息
export function addTechnician(data) {
  return request({
    url: '/system/technician',
    method: 'post',
    data: data
  })
}

// 修改技术员信息
export function updateTechnician(data) {
  return request({
    url: '/system/technician',
    method: 'put',
    data: data
  })
}

// 删除技术员信息
export function delTechnician(id) {
  return request({
    url: '/system/technician/' + id,
    method: 'delete'
  })
}
