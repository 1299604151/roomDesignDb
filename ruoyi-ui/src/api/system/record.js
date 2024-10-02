import request from '@/utils/request'

// 查询授课信息列表
export function listRecord(query) {
  return request({
    url: '/system/record/list',
    method: 'get',
    params: query
  })
}

// 查询授课信息详细
export function getRecord(id) {
  return request({
    url: '/system/record/' + id,
    method: 'get'
  })
}

// 新增授课信息
export function addRecord(data) {
  return request({
    url: '/system/record',
    method: 'post',
    data: data
  })
}
// 授课
export function teachRecord(data) {
  return request({
    url: '/system/record/teach',
    method: 'post',
    data: data
  })
}

// 修改授课信息
export function updateRecord(data) {
  return request({
    url: '/system/record',
    method: 'put',
    data: data
  })
}

// 删除授课信息
export function delRecord(id) {
  return request({
    url: '/system/record/' + id,
    method: 'delete'
  })
}
