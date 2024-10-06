import request from '@/utils/request'

// 查询设计方案列表
export function listSchemes(query) {
  return request({
    url: '/system/schemes/list',
    method: 'get',
    params: query
  })
}

// 查询设计方案详细
export function getSchemes(id) {
  return request({
    url: '/system/schemes/' + id,
    method: 'get'
  })
}

// 新增设计方案
export function addSchemes(data) {
  return request({
    url: '/system/schemes',
    method: 'post',
    data: data
  })
}

// 修改设计方案
export function updateSchemes(data) {
  return request({
    url: '/system/schemes',
    method: 'put',
    data: data
  })
}

// 删除设计方案
export function delSchemes(id) {
  return request({
    url: '/system/schemes/' + id,
    method: 'delete'
  })
}
