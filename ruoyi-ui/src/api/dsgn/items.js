import request from '@/utils/request'

// 查询家具素材列表
export function listItems(query) {
  return request({
    url: '/system/items/list',
    method: 'get',
    params: query
  })
}

// 查询家具素材详细
export function getItems(id) {
  return request({
    url: '/system/items/' + id,
    method: 'get'
  })
}

// 新增家具素材
export function addItems(data) {
  return request({
    url: '/system/items',
    method: 'post',
    data: data
  })
}

// 修改家具素材
export function updateItems(data) {
  return request({
    url: '/system/items',
    method: 'put',
    data: data
  })
}

// 删除家具素材
export function delItems(id) {
  return request({
    url: '/system/items/' + id,
    method: 'delete'
  })
}
