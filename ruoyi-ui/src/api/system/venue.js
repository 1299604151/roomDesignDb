import request from '@/utils/request'

// 查询场地信息列表
export function listVenue(query) {
  return request({
    url: '/system/venue/list',
    method: 'get',
    params: query
  })
}

// 查询场地信息详细
export function getVenue(id) {
  return request({
    url: '/system/venue/' + id,
    method: 'get'
  })
}

// 新增场地信息
export function addVenue(data) {
  return request({
    url: '/system/venue',
    method: 'post',
    data: data
  })
}

// 修改场地信息
export function updateVenue(data) {
  return request({
    url: '/system/venue',
    method: 'put',
    data: data
  })
}

// 删除场地信息
export function delVenue(id) {
  return request({
    url: '/system/venue/' + id,
    method: 'delete'
  })
}
